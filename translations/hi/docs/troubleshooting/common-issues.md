<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T17:00:42+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "hi"
}
-->
# सामान्य समस्याएँ और समाधान

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 7 - समस्या निवारण और डिबगिंग
- **⬅️ पिछला अध्याय**: [अध्याय 6: प्री-फ्लाइट चेक्स](../pre-deployment/preflight-checks.md)
- **➡️ अगला**: [डिबगिंग गाइड](debugging.md)
- **🚀 अगला अध्याय**: [अध्याय 8: प्रोडक्शन और एंटरप्राइज पैटर्न](../ai-foundry/production-ai-practices.md)

## परिचय

यह व्यापक समस्या निवारण गाइड Azure Developer CLI का उपयोग करते समय अक्सर आने वाली समस्याओं को कवर करता है। प्रमाणीकरण, डिप्लॉयमेंट, इंफ्रास्ट्रक्चर प्रोविजनिंग और एप्लिकेशन कॉन्फ़िगरेशन से जुड़ी सामान्य समस्याओं का निदान, समाधान और हल करना सीखें। प्रत्येक समस्या में विस्तृत लक्षण, मूल कारण और चरण-दर-चरण समाधान प्रक्रियाएँ शामिल हैं।

## सीखने के लक्ष्य

इस गाइड को पूरा करके, आप:
- Azure Developer CLI समस्याओं के लिए डायग्नोस्टिक तकनीकों में महारत हासिल करेंगे
- सामान्य प्रमाणीकरण और अनुमति समस्याओं को समझेंगे और उनका समाधान करेंगे
- डिप्लॉयमेंट विफलताओं, इंफ्रास्ट्रक्चर प्रोविजनिंग त्रुटियों और कॉन्फ़िगरेशन समस्याओं को हल करेंगे
- सक्रिय निगरानी और डिबगिंग रणनीतियों को लागू करेंगे
- जटिल समस्याओं के लिए व्यवस्थित समस्या निवारण पद्धतियाँ अपनाएँगे
- भविष्य की समस्याओं को रोकने के लिए उचित लॉगिंग और निगरानी कॉन्फ़िगर करेंगे

## सीखने के परिणाम

गाइड पूरा करने के बाद, आप सक्षम होंगे:
- Azure Developer CLI समस्याओं का निदान करने के लिए अंतर्निहित डायग्नोस्टिक टूल का उपयोग करें
- प्रमाणीकरण, सब्सक्रिप्शन और अनुमति से संबंधित समस्याओं को स्वतंत्र रूप से हल करें
- डिप्लॉयमेंट विफलताओं और इंफ्रास्ट्रक्चर प्रोविजनिंग त्रुटियों का प्रभावी ढंग से समाधान करें
- एप्लिकेशन कॉन्फ़िगरेशन समस्याओं और पर्यावरण-विशिष्ट मुद्दों को डिबग करें
- संभावित समस्याओं की पहचान करने के लिए निगरानी और अलर्टिंग को लागू करें
- लॉगिंग, डिबगिंग और समस्या समाधान वर्कफ़्लो के लिए सर्वोत्तम प्रथाओं को लागू करें

## त्वरित निदान

विशिष्ट समस्याओं में जाने से पहले, डायग्नोस्टिक जानकारी एकत्र करने के लिए ये कमांड चलाएँ:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## प्रमाणीकरण समस्याएँ

### समस्या: "एक्सेस टोकन प्राप्त करने में विफल"
**लक्षण:**
- `azd up` प्रमाणीकरण त्रुटियों के साथ विफल होता है
- कमांड "अनधिकृत" या "पहुंच अस्वीकृत" लौटाते हैं

**समाधान:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### समस्या: डिप्लॉयमेंट के दौरान "पर्याप्त विशेषाधिकार नहीं"
**लक्षण:**
- डिप्लॉयमेंट अनुमति त्रुटियों के साथ विफल होता है
- कुछ Azure संसाधन नहीं बना सकते

**समाधान:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: मल्टी-टेनेंट प्रमाणीकरण समस्याएँ
**समाधान:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ इंफ्रास्ट्रक्चर प्रोविजनिंग त्रुटियाँ

### समस्या: संसाधन नाम संघर्ष
**लक्षण:**
- "संसाधन नाम पहले से मौजूद है" त्रुटियाँ
- संसाधन निर्माण के दौरान डिप्लॉयमेंट विफल

**समाधान:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### समस्या: स्थान/क्षेत्र उपलब्ध नहीं
**लक्षण:**
- "स्थान 'xyz' संसाधन प्रकार के लिए उपलब्ध नहीं है"
- चयनित क्षेत्र में कुछ SKUs उपलब्ध नहीं

**समाधान:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### समस्या: कोटा पार त्रुटियाँ
**लक्षण:**
- "संसाधन प्रकार के लिए कोटा पार"
- "संसाधनों की अधिकतम संख्या तक पहुँचा गया"

**समाधान:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### समस्या: Bicep टेम्पलेट त्रुटियाँ
**लक्षण:**
- टेम्पलेट मान्यता विफलता
- Bicep फ़ाइलों में सिंटैक्स त्रुटियाँ

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

## 🚀 डिप्लॉयमेंट विफलताएँ

### समस्या: बिल्ड विफलताएँ
**लक्षण:**
- डिप्लॉयमेंट के दौरान एप्लिकेशन बिल्ड विफल
- पैकेज इंस्टॉलेशन त्रुटियाँ

**समाधान:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### समस्या: कंटेनर डिप्लॉयमेंट विफलताएँ
**लक्षण:**
- कंटेनर ऐप्स शुरू करने में विफल
- इमेज पुल त्रुटियाँ

**समाधान:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### समस्या: डेटाबेस कनेक्शन विफलताएँ
**लक्षण:**
- एप्लिकेशन डेटाबेस से कनेक्ट नहीं कर सकता
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

### समस्या: पर्यावरण चर काम नहीं कर रहे
**लक्षण:**
- ऐप कॉन्फ़िगरेशन मान नहीं पढ़ सकता
- पर्यावरण चर खाली दिखाई देते हैं

**समाधान:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### समस्या: SSL/TLS प्रमाणपत्र समस्याएँ
**लक्षण:**
- HTTPS काम नहीं कर रहा
- प्रमाणपत्र मान्यता त्रुटियाँ

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
- फ्रंटएंड API को कॉल नहीं कर सकता
- क्रॉस-ओरिजिन अनुरोध अवरुद्ध

**समाधान:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 पर्यावरण प्रबंधन समस्याएँ

### समस्या: पर्यावरण स्विचिंग समस्याएँ
**लक्षण:**
- गलत पर्यावरण उपयोग हो रहा है
- कॉन्फ़िगरेशन सही तरीके से स्विच नहीं हो रहा

**समाधान:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### समस्या: पर्यावरण भ्रष्टाचार
**लक्षण:**
- पर्यावरण अमान्य स्थिति दिखाता है
- संसाधन कॉन्फ़िगरेशन से मेल नहीं खाते

**समाधान:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 प्रदर्शन समस्याएँ

### समस्या: धीमे डिप्लॉयमेंट समय
**लक्षण:**
- डिप्लॉयमेंट में बहुत समय लग रहा है
- डिप्लॉयमेंट के दौरान टाइमआउट

**समाधान:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### समस्या: एप्लिकेशन प्रदर्शन समस्याएँ
**लक्षण:**
- धीमी प्रतिक्रिया समय
- उच्च संसाधन उपयोग

**समाधान:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ समस्या निवारण उपकरण और कमांड

### डिबग कमांड
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### लॉग विश्लेषण
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

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

### कब बढ़ाएँ
- सभी समाधान आज़माने के बाद भी प्रमाणीकरण समस्याएँ बनी रहती हैं
- Azure सेवाओं के साथ इंफ्रास्ट्रक्चर समस्याएँ
- बिलिंग या सब्सक्रिप्शन से संबंधित समस्याएँ
- सुरक्षा चिंताएँ या घटनाएँ

### सहायता चैनल
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

### जानकारी एकत्र करें
सहायता से संपर्क करने से पहले, निम्नलिखित एकत्र करें:
- `azd version` आउटपुट
- `azd info` आउटपुट
- त्रुटि संदेश (पूर्ण पाठ)
- समस्या को पुन: उत्पन्न करने के चरण
- पर्यावरण विवरण (`azd env show`)
- समस्या शुरू होने का समय

### लॉग संग्रह स्क्रिप्ट
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 समस्या रोकथाम

### प्री-डिप्लॉयमेंट चेकलिस्ट
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
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### नियमित रखरखाव
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## संबंधित संसाधन

- [डिबगिंग गाइड](debugging.md) - उन्नत डिबगिंग तकनीकें
- [संसाधन प्रोविजनिंग](../deployment/provisioning.md) - इंफ्रास्ट्रक्चर समस्या निवारण
- [क्षमता योजना](../pre-deployment/capacity-planning.md) - संसाधन योजना मार्गदर्शन
- [SKU चयन](../pre-deployment/sku-selection.md) - सेवा स्तर अनुशंसाएँ

---

**टिप**: इस गाइड को बुकमार्क करके रखें और जब भी समस्याएँ आएँ, इसे देखें। अधिकांश समस्याएँ पहले देखी गई हैं और उनके स्थापित समाधान हैं!

---

**नेविगेशन**
- **पिछला पाठ**: [संसाधन प्रोविजनिंग](../deployment/provisioning.md)
- **अगला पाठ**: [डिबगिंग गाइड](debugging.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।