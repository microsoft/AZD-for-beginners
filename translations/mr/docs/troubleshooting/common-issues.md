<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T19:27:58+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "mr"
}
-->
# सामान्य समस्या आणि उपाय

## परिचय

ही व्यापक समस्या निवारण मार्गदर्शिका Azure Developer CLI वापरताना सर्वात सामान्य समस्या कव्हर करते. प्रमाणीकरण, डिप्लॉयमेंट, इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग आणि ऍप्लिकेशन कॉन्फिगरेशनसंबंधित समस्या ओळखणे, निवारण करणे आणि सोडवणे शिकून घ्या. प्रत्येक समस्येसाठी तपशीलवार लक्षणे, मूळ कारणे आणि चरण-दर-चरण उपाय दिले आहेत.

## शिकण्याची उद्दिष्टे

या मार्गदर्शिकेचा अभ्यास करून तुम्ही:
- Azure Developer CLI समस्यांसाठी निदान तंत्रे आत्मसात कराल
- सामान्य प्रमाणीकरण आणि परवानगी समस्यांचे निराकरण समजून घ्याल
- डिप्लॉयमेंट अपयश, इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी आणि कॉन्फिगरेशन समस्यांचे निराकरण कराल
- सक्रिय मॉनिटरिंग आणि डीबगिंग धोरणे अंमलात आणाल
- जटिल समस्यांसाठी प्रणालीबद्ध समस्या निवारण पद्धती लागू कराल
- भविष्यातील समस्यांना प्रतिबंध करण्यासाठी योग्य लॉगिंग आणि मॉनिटरिंग कॉन्फिगर कराल

## शिकण्याची परिणामे

पूर्ण झाल्यावर तुम्ही:
- Azure Developer CLI समस्यांचे अंतर्गत निदान साधनांचा वापर करून निदान करू शकाल
- प्रमाणीकरण, सबस्क्रिप्शन आणि परवानगी-संबंधित समस्या स्वतंत्रपणे सोडवू शकाल
- डिप्लॉयमेंट अपयश आणि इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी प्रभावीपणे निवारण करू शकाल
- ऍप्लिकेशन कॉन्फिगरेशन समस्या आणि पर्यावरण-विशिष्ट समस्यांचे डीबगिंग करू शकाल
- संभाव्य समस्यांची सक्रियपणे ओळख करण्यासाठी मॉनिटरिंग आणि अलर्टिंग अंमलात आणू शकाल
- लॉगिंग, डीबगिंग आणि समस्या निराकरण कार्यप्रवाहांसाठी सर्वोत्तम पद्धती लागू करू शकाल

## जलद निदान

विशिष्ट समस्यांमध्ये जाण्यापूर्वी, निदान माहिती गोळा करण्यासाठी हे आदेश चालवा:

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

## प्रमाणीकरण समस्या

### समस्या: "प्रवेश टोकन मिळवण्यात अयशस्वी"
**लक्षणे:**
- `azd up` प्रमाणीकरण त्रुटींसह अयशस्वी होते
- आदेश "अनधिकृत" किंवा "प्रवेश नाकारला" परत करतात

**उपाय:**
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

### समस्या: डिप्लॉयमेंट दरम्यान "अपुरे विशेषाधिकार"
**लक्षणे:**
- परवानगी त्रुटींसह डिप्लॉयमेंट अयशस्वी होते
- विशिष्ट Azure संसाधने तयार करता येत नाहीत

**उपाय:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: मल्टी-टेनंट प्रमाणीकरण समस्या
**उपाय:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ इन्फ्रास्ट्रक्चर प्रोव्हिजनिंग त्रुटी

### समस्या: संसाधन नावाचे संघर्ष
**लक्षणे:**
- "संसाधन नाव आधीच अस्तित्वात आहे" त्रुटी
- संसाधन निर्मितीदरम्यान डिप्लॉयमेंट अयशस्वी होते

**उपाय:**
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

### समस्या: स्थान/प्रदेश उपलब्ध नाही
**लक्षणे:**
- "संसाधन प्रकारासाठी स्थान 'xyz' उपलब्ध नाही"
- निवडलेल्या प्रदेशात विशिष्ट SKUs उपलब्ध नाहीत

**उपाय:**
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

### समस्या: कोटा ओलांडलेली त्रुटी
**लक्षणे:**
- "संसाधन प्रकारासाठी कोटा ओलांडला"
- "संसाधनांची कमाल संख्या गाठली"

**उपाय:**
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

### समस्या: Bicep टेम्पलेट त्रुटी
**लक्षणे:**
- टेम्पलेट सत्यापन अपयश
- Bicep फाइल्समध्ये सिंटॅक्स त्रुटी

**उपाय:**
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

## 🚀 डिप्लॉयमेंट अपयश

### समस्या: बिल्ड अपयश
**लक्षणे:**
- ऍप्लिकेशन डिप्लॉयमेंट दरम्यान बिल्ड अयशस्वी होते
- पॅकेज इंस्टॉलेशन त्रुटी

**उपाय:**
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

### समस्या: कंटेनर डिप्लॉयमेंट अपयश
**लक्षणे:**
- कंटेनर ऍप्स सुरू होण्यात अयशस्वी
- इमेज पुल त्रुटी

**उपाय:**
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

### समस्या: डेटाबेस कनेक्शन अपयश
**लक्षणे:**
- ऍप्लिकेशन डेटाबेसशी कनेक्ट होऊ शकत नाही
- कनेक्शन टाइमआउट त्रुटी

**उपाय:**
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

## 🔧 कॉन्फिगरेशन समस्या

### समस्या: पर्यावरणीय व्हेरिएबल्स कार्य करत नाहीत
**लक्षणे:**
- ऍप्लिकेशन कॉन्फिगरेशन मूल्ये वाचू शकत नाही
- पर्यावरणीय व्हेरिएबल्स रिकाम्या दिसतात

**उपाय:**
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

### समस्या: SSL/TLS प्रमाणपत्र समस्या
**लक्षणे:**
- HTTPS कार्य करत नाही
- प्रमाणपत्र सत्यापन त्रुटी

**उपाय:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कॉन्फिगरेशन समस्या
**लक्षणे:**
- फ्रंटएंड API कॉल करू शकत नाही
- क्रॉस-ऑरिजिन विनंती अवरोधित

**उपाय:**
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

## 🌍 पर्यावरण व्यवस्थापन समस्या

### समस्या: पर्यावरण स्विचिंग समस्या
**लक्षणे:**
- चुकीचे पर्यावरण वापरले जात आहे
- कॉन्फिगरेशन योग्य प्रकारे स्विच होत नाही

**उपाय:**
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
**लक्षणे:**
- पर्यावरण अवैध स्थिती दर्शवते
- संसाधने कॉन्फिगरेशनशी जुळत नाहीत

**उपाय:**
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

## 🔍 कार्यक्षमता समस्या

### समस्या: डिप्लॉयमेंट वेळा मंद
**लक्षणे:**
- डिप्लॉयमेंट खूप वेळ घेत आहे
- डिप्लॉयमेंट दरम्यान टाइमआउट्स

**उपाय:**
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

### समस्या: ऍप्लिकेशन कार्यक्षमता समस्या
**लक्षणे:**
- प्रतिसाद वेळा मंद
- उच्च संसाधन वापर

**उपाय:**
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

## 🛠️ समस्या निवारण साधने आणि आदेश

### डीबग आदेश
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

### संसाधन तपासणी
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त मदत मिळवणे

### कधी उन्नती करावी
- सर्व उपाय प्रयत्न करूनही प्रमाणीकरण समस्या कायम राहतात
- Azure सेवांसह इन्फ्रास्ट्रक्चर समस्या
- बिलिंग किंवा सबस्क्रिप्शन-संबंधित समस्या
- सुरक्षा चिंता किंवा घटना

### समर्थन चॅनेल
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

### गोळा करण्यासाठी माहिती
समर्थनाशी संपर्क साधण्यापूर्वी, खालील गोळा करा:
- `azd version` आउटपुट
- `azd info` आउटपुट
- त्रुटी संदेश (पूर्ण मजकूर)
- समस्या पुनरुत्पादित करण्याचे चरण
- पर्यावरण तपशील (`azd env show`)
- समस्या सुरू झाल्याचा कालावधी

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

## 📊 समस्या प्रतिबंध

### पूर्व-डिप्लॉयमेंट चेकलिस्ट
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

### मॉनिटरिंग सेटअप
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

### नियमित देखभाल
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## संबंधित संसाधने

- [डीबगिंग मार्गदर्शिका](debugging.md) - प्रगत डीबगिंग तंत्र
- [संसाधने प्रोव्हिजनिंग](../deployment/provisioning.md) - इन्फ्रास्ट्रक्चर समस्या निवारण
- [क्षमता नियोजन](../pre-deployment/capacity-planning.md) - संसाधन नियोजन मार्गदर्शन
- [SKU निवड](../pre-deployment/sku-selection.md) - सेवा स्तर शिफारसी

---

**टीप**: ही मार्गदर्शिका बुकमार्क करा आणि तुम्हाला समस्या आल्यावर याचा संदर्भ घ्या. बहुतेक समस्या यापूर्वी पाहिल्या गेल्या आहेत आणि त्यांचे स्थापित उपाय आहेत!

---

**नेव्हिगेशन**
- **मागील धडा**: [संसाधने प्रोव्हिजनिंग](../deployment/provisioning.md)
- **पुढील धडा**: [डीबगिंग मार्गदर्शिका](debugging.md)

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून निर्माण होणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.