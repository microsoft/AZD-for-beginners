# सामान्य समस्याएं और समाधान

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या निवारण और डीबगिंग
- **⬅️ पिछला अध्याय**: [Chapter 6: Pre-flight Checks](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ अगला**: [Debugging Guide](debugging.md)
- **🚀 अगला अध्याय**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)

## परिचय

यह व्यापक समस्या निवारण गाइड Azure Developer CLI के उपयोग के दौरान सबसे अधिक सामना की जाने वाली समस्याओं को कवर करता है। ऑथेंटिकेशन, तैनाती, अवसंरचना प्रोविजनिंग, और एप्लिकेशन कॉन्फ़िगरेशन की सामान्य समस्याओं का निदान, समस्या निवारण और समाधान करना सीखें। प्रत्येक समस्या में विस्तृत लक्षण, मूल कारण, और चरण-दर-चरण समाधान प्रक्रियाएं शामिल हैं।

## सीखने के लक्ष्य

इस गाइड को पूरा करने पर आप:
- Azure Developer CLI के मुद्दों के निदान तकनीकों में महारत हासिल करेंगे
- सामान्य ऑथेंटिकेशन और अनुमति समस्याओं और उनके समाधान को समझेंगे
- तैनाती विफलताओं, अवसंरचना प्रोविजनिंग त्रुटियों, और कॉन्फ़िगरेशन समस्याओं को हल करेंगे
- सक्रिय निगरानी और डीबगिंग रणनीतियां लागू करेंगे
- जटिल समस्याओं के लिए व्यवस्थित समस्या निवारण पद्धतियों को लागू करेंगे
- भविष्य की समस्याओं को रोकने के लिए उचित लॉगिंग और निगरानी कॉन्फ़िगर करेंगे

## सीखने के परिणाम

पूरा करने पर आप सक्षम होंगे:
- इनबिल्ट डायग्नोस्टिक टूल्स का उपयोग करके Azure Developer CLI समस्याओं का निदान करना
- ऑथेंटिकेशन, सब्सक्रिप्शन, और अनुमति संबंधी समस्याओं को स्वतंत्र रूप से हल करना
- तैनाती विफलताओं और अवसंरचना प्रोविजनिंग त्रुटियों का प्रभावी समस्या निवारण करना
- एप्लिकेशन कॉन्फ़िगरेशन समस्याओं और पर्यावरण-विशिष्ट समस्याओं का डीबगिंग करना
- संभावित समस्याओं की सक्रिय पहचान के लिए निगरानी और अलर्टिंग लागू करना
- लॉगिंग, डीबगिंग, और समस्या समाधान वर्कफ़्लोज़ के लिए सर्वोत्तम प्रथाओं को लागू करना

## त्वरित निदान

> उदाहरण नाम/आईडी को अपने परिवेश के मानों से बदलें। Bash, Bicep, JavaScript, और पैरामीटर-फ़ाइल खंडों को नीचे अलग-अलग लेबल किया गया है; ये एक ही निष्पादित स्क्रिप्ट नहीं हैं। विनाशकारी कार्यों की समीक्षा करें और डायग्नोस्टिक्स साझा करने से पहले गुप्त सूचनाओं को हटा दें। `azd monitor --logs` एक ब्राउज़र खोलता है; यह टर्मिनल लॉग्स को स्ट्रीम नहीं करता।

विशिष्ट समस्याओं में जाने से पहले, निदान जानकारी इकट्ठा करने के लिए ये कमांड चलाएं:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## ऑथेंटिकेशन समस्याएँ

### समस्या: "एक्सेस टोकन प्राप्त करने में विफल"
**लक्षण:**
- `azd up` ऑथेंटिकेशन त्रुटियों के साथ विफल होता है
- कमांड "अनधिकृत" या "पहुंच अस्वीकार" लौटाते हैं

**समाधान:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### समस्या: तैनाती के दौरान "पर्याप्त अधिकार नहीं"
**लक्षण:**
- तैनाती अनुमति त्रुटियों के साथ विफल होती है
- कुछ Azure संसाधन नहीं बना पाते

**समाधान:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: मल्टी-टेनेंट ऑथेंटिकेशन समस्याएँ
**समाधान:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ अवसंरचना प्रोविजनिंग त्रुटियाँ

### समस्या: संसाधन नाम संघर्ष
**लक्षण:**
- "संसाधन नाम पहले से मौजूद है" त्रुटियाँ
- संसाधन निर्माण के दौरान तैनाती विफल होती है

**समाधान:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### समस्या: स्थान/क्षेत्र उपलब्ध नहीं है
**लक्षण:**
- "संसाधन प्रकार के लिए स्थान 'xyz' उपलब्ध नहीं है"
- चयनित क्षेत्र में कुछ SKU उपलब्ध नहीं हैं

**समाधान:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

लोकेशन वेरिएबल बदलने से मौजूदा संसाधन माइग्रेट नहीं होते। एक मौजूदा संसाधन समूह या संसाधन स्थान परिवर्तन को अस्वीकार कर सकता है; क्षेत्रीय पुनः तैनाती के लिए अलग वातावरण का उपयोग करें।

### समस्या: कोटा अधिकतम सीमा त्रुटियाँ
**लक्षण:**
- "संसाधन प्रकार के लिए कोटा अधिकतम सीमा पार"
- "संसाधनों की अधिकतम संख्या पहुँच गई"

**समाधान:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

विकास के लिए, `infra/main.parameters.json` में समर्थित छोटे SKU का चयन करें:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: Bicep टेम्प्लेट त्रुटियाँ
**लक्षण:**
- टेम्प्लेट सत्यापन विफलताएँ
- Bicep फाइलों में सिंटैक्स त्रुटियाँ

**समाधान:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 तैनाती विफलताएँ

### समस्या: बिल्ड विफलताएँ
**लक्षण:**
- तैनाती के दौरान एप्लिकेशन बिल्ड विफल हो जाता है
- पैकेज इंस्टॉलेशन त्रुटियाँ

**समाधान:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर तैनाती विफलताएँ
**लक्षण:**
- कंटेनर ऐप्स शुरू नहीं होते
- इमेज पुल त्रुटियाँ

**समाधान:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन विफलताएँ
**लक्षण:**
- एप्लिकेशन डेटाबेस से कनेक्ट नहीं कर पाता
- कनेक्शन टाइमआउट त्रुटियाँ

**समाधान:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 कॉन्फ़िगरेशन समस्याएँ

### समस्या: पर्यावरण चर कार्य नहीं कर रहे
**लक्षण:**
- ऐप कॉन्फ़िगरेशन मान पढ़ नहीं पाता
- पर्यावरण चर खाली प्रतीत होते हैं

**समाधान:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्याएँ
**लक्षण:**
- HTTPS काम नहीं कर रहा
- प्रमाणपत्र सत्यापन त्रुटियाँ

**समाधान:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फ़िगरेशन समस्याएँ
**लक्षण:**
- फ्रंटेंड API को कॉल नहीं कर पाता
- क्रॉस-ओरिजिन अनुरोध ब्लॉक हुआ

**समाधान:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. अपने मौजूदा एक्सप्रेस एप्लिकेशन को अपडेट करें (जिसमें `cors` इम्पोर्ट किया गया हो):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 पर्यावरण प्रबंधन समस्याएँ

### समस्या: पर्यावरण स्विचिंग समस्याएँ
**लक्षण:**
- गलत पर्यावरण उपयोग हो रहा है
- कॉन्फ़िगरेशन सही ढंग से स्विच नहीं हो रहा

**समाधान:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### समस्या: पर्यावरण भ्रष्टाचार
**लक्षण:**
- पर्यावरण अमान्य स्थिति दिखा रहा है
- संसाधन कॉन्फ़िगरेशन से मेल नहीं खाते

**समाधान:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 प्रदर्शन समस्याएँ

### समस्या: धीमे तैनाती समय
**लक्षण:**
- तैनाती में अधिक समय लगना
- तैनाती के दौरान टाइमआउट

**समाधान:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### समस्या: एप्लिकेशन प्रदर्शन समस्याएँ
**लक्षण:**
- धीमा प्रतिक्रिया समय
- उच्च संसाधन उपयोग

**समाधान:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ समस्या निवारण उपकरण और कमांड

### डीबग कमांड्स
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### संसाधन जांच
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त सहायता प्राप्त करना

### कब बढ़ाना है
- सभी समाधानों को आज़माने के बाद भी ऑथेंटिकेशन समस्याएँ बनी रहें
- Azure सेवाओं के साथ अवसंरचना समस्याएँ
- बिलिंग या सब्सक्रिप्शन-संबंधित मुद्दे
- सुरक्षा चिंताएँ या घटनाएं

### समर्थन चैनल
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### एकत्रित करने वाली जानकारी
समर्थन से संपर्क करने से पहले एकत्रित करें:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (वर्तमान तैनाती स्थिति)
- त्रुटि संदेश (पूरा टेक्स्ट)
- समस्या दोहराने के चरण
- संशोधित पर्यावरण विवरण (कभी भी raw `azd env get-values` साझा न करें, जिसमें गुप्त जानकारी हो सकती है)
- समस्या शुरू होने का समयरेखा

### लॉग संग्रह स्क्रिप्ट
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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 समस्या रोकथाम

### पूर्व-तैनाती चेकलिस्ट
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### निगरानी सेटअप
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### नियमित रखरखाव
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## संबंधित संसाधन

- [Debugging Guide](debugging.md) - उन्नत डीबगिंग तकनीकें
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - अवसंरचना समस्या निवारण
- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन योजना मार्गदर्शन
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - सेवा स्तर सिफारिशें

---

**टिप**: इस गाइड को बुकमार्क करके रखें और जब भी आपको समस्या हो इसे देखें। अधिकांश समस्याएं पहले देखी जा चुकी हैं और उनके स्थापित समाधान उपलब्ध हैं!

---

**नेविगेशन**
- **पिछला पाठ**: [Provisioning Resources](../chapter-04-infrastructure/provisioning.md)
- **अगला पाठ**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->