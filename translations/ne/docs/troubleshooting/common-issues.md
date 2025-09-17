<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T20:03:42+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ne"
}
-->
# सामान्य समस्याहरू र समाधानहरू

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय ७ - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो अध्याय**: [अध्याय ६: प्रि-फ्लाइट चेकहरू](../pre-deployment/preflight-checks.md)
- **➡️ अगाडि**: [डिबगिङ गाइड](debugging.md)
- **🚀 अर्को अध्याय**: [अध्याय ८: उत्पादन र उद्यम ढाँचाहरू](../ai-foundry/production-ai-practices.md)

## परिचय

यो विस्तृत समस्या समाधान गाइडले Azure Developer CLI प्रयोग गर्दा प्राय: देखिने समस्याहरू समेट्छ। प्रमाणीकरण, डिप्लोयमेन्ट, पूर्वाधार प्रावधान, र एप्लिकेसन कन्फिगरेसनसँग सम्बन्धित सामान्य समस्याहरूलाई कसरी निदान गर्ने, समाधान गर्ने, र समाधान गर्ने सिक्नुहोस्। प्रत्येक समस्यामा विस्तृत लक्षणहरू, मूल कारणहरू, र चरण-दर-चरण समाधान प्रक्रियाहरू समावेश छन्।

## सिक्ने लक्ष्यहरू

यो गाइड पूरा गरेर, तपाईं:
- Azure Developer CLI समस्याहरूको लागि निदान प्रविधिहरूमा निपुण हुनुहुनेछ
- सामान्य प्रमाणीकरण र अनुमति समस्याहरूको समाधान बुझ्नुहुनेछ
- डिप्लोयमेन्ट असफलता, पूर्वाधार प्रावधान त्रुटिहरू, र कन्फिगरेसन समस्याहरू समाधान गर्नुहुनेछ
- सक्रिय निगरानी र डिबगिङ रणनीतिहरू कार्यान्वयन गर्नुहुनेछ
- जटिल समस्याहरूको लागि प्रणालीगत समस्या समाधान पद्धतिहरू लागू गर्नुहुनेछ
- भविष्यमा समस्याहरू रोक्न उचित लगिङ र निगरानी कन्फिगर गर्नुहुनेछ

## सिक्ने परिणामहरू

पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- Azure Developer CLI समस्याहरूलाई बिल्ट-इन डायग्नोस्टिक उपकरणहरू प्रयोग गरेर निदान गर्नुहोस्
- प्रमाणीकरण, सब्सक्रिप्शन, र अनुमति सम्बन्धित समस्याहरू स्वतन्त्र रूपमा समाधान गर्नुहोस्
- डिप्लोयमेन्ट असफलता र पूर्वाधार प्रावधान त्रुटिहरू प्रभावकारी रूपमा समाधान गर्नुहोस्
- एप्लिकेसन कन्फिगरेसन समस्याहरू र वातावरण-विशिष्ट समस्याहरू डिबग गर्नुहोस्
- सम्भावित समस्याहरूलाई सक्रिय रूपमा पहिचान गर्न निगरानी र अलर्टिङ कार्यान्वयन गर्नुहोस्
- लगिङ, डिबगिङ, र समस्या समाधान कार्यप्रवाहहरूको लागि उत्कृष्ट अभ्यासहरू लागू गर्नुहोस्

## छिटो निदान

विशिष्ट समस्याहरूमा जानु अघि, यी कमाण्डहरू चलाएर निदान जानकारी संकलन गर्नुहोस्:

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

## प्रमाणीकरण समस्याहरू

### समस्या: "एक्सेस टोकन प्राप्त गर्न असफल"
**लक्षणहरू:**
- `azd up` प्रमाणीकरण त्रुटिहरूको साथ असफल हुन्छ
- कमाण्डहरूले "अनधिकृत" वा "पहुंच अस्वीकृत" फर्काउँछ

**समाधानहरू:**
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

### समस्या: डिप्लोयमेन्टको क्रममा "अपर्याप्त विशेषाधिकार"
**लक्षणहरू:**
- अनुमति त्रुटिहरूको साथ डिप्लोयमेन्ट असफल हुन्छ
- केही Azure स्रोतहरू सिर्जना गर्न सकिँदैन

**समाधानहरू:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: मल्टि-टेनेन्ट प्रमाणीकरण समस्याहरू
**समाधानहरू:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ पूर्वाधार प्रावधान त्रुटिहरू

### समस्या: स्रोत नामको द्वन्द्व
**लक्षणहरू:**
- "स्रोत नाम पहिले नै अवस्थित छ" त्रुटिहरू
- स्रोत सिर्जनाको क्रममा डिप्लोयमेन्ट असफल

**समाधानहरू:**
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

### समस्या: स्थान/क्षेत्र उपलब्ध छैन
**लक्षणहरू:**
- "स्रोत प्रकारको लागि स्थान 'xyz' उपलब्ध छैन"
- चयन गरिएको क्षेत्रमा निश्चित SKUs उपलब्ध छैनन्

**समाधानहरू:**
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

### समस्या: कोटा पार गरियो त्रुटिहरू
**लक्षणहरू:**
- "स्रोत प्रकारको लागि कोटा पार गरियो"
- "स्रोतहरूको अधिकतम संख्या पुगेको छ"

**समाधानहरू:**
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

### समस्या: Bicep टेम्पलेट त्रुटिहरू
**लक्षणहरू:**
- टेम्पलेट मान्यता असफलता
- Bicep फाइलहरूमा सिन्ट्याक्स त्रुटिहरू

**समाधानहरू:**
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

## 🚀 डिप्लोयमेन्ट असफलता

### समस्या: निर्माण असफलता
**लक्षणहरू:**
- डिप्लोयमेन्टको क्रममा एप्लिकेसन निर्माण असफल
- प्याकेज स्थापना त्रुटिहरू

**समाधानहरू:**
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

### समस्या: कन्टेनर डिप्लोयमेन्ट असफलता
**लक्षणहरू:**
- कन्टेनर एप्स सुरु गर्न असफल
- इमेज पुल त्रुटिहरू

**समाधानहरू:**
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

### समस्या: डाटाबेस कनेक्शन असफलता
**लक्षणहरू:**
- एप्लिकेसन डाटाबेससँग जडान गर्न सक्दैन
- कनेक्शन टाइमआउट त्रुटिहरू

**समाधानहरू:**
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

## 🔧 कन्फिगरेसन समस्याहरू

### समस्या: वातावरण चरहरू काम गर्दैन
**लक्षणहरू:**
- एप्लिकेसन कन्फिगरेसन मानहरू पढ्न सक्दैन
- वातावरण चरहरू खाली देखिन्छन्

**समाधानहरू:**
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

### समस्या: SSL/TLS प्रमाणपत्र समस्याहरू
**लक्षणहरू:**
- HTTPS काम गर्दैन
- प्रमाणपत्र मान्यता त्रुटिहरू

**समाधानहरू:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS कन्फिगरेसन समस्याहरू
**लक्षणहरू:**
- फ्रन्टएन्डले API कल गर्न सक्दैन
- क्रस-ओरिजिन अनुरोध अवरुद्ध

**समाधानहरू:**
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

## 🌍 वातावरण व्यवस्थापन समस्याहरू

### समस्या: वातावरण स्विचिङ समस्याहरू
**लक्षणहरू:**
- गलत वातावरण प्रयोग भइरहेको छ
- कन्फिगरेसन सही रूपमा स्विच हुँदै छैन

**समाधानहरू:**
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

### समस्या: वातावरण भ्रष्टता
**लक्षणहरू:**
- वातावरणले अमान्य अवस्था देखाउँछ
- स्रोतहरू कन्फिगरेसनसँग मेल खाँदैनन्

**समाधानहरू:**
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

## 🔍 प्रदर्शन समस्याहरू

### समस्या: ढिलो डिप्लोयमेन्ट समय
**लक्षणहरू:**
- डिप्लोयमेन्टहरू धेरै समय लिन्छन्
- डिप्लोयमेन्टको क्रममा टाइमआउट

**समाधानहरू:**
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

### समस्या: एप्लिकेसन प्रदर्शन समस्याहरू
**लक्षणहरू:**
- ढिलो प्रतिक्रिया समय
- उच्च स्रोत उपयोग

**समाधानहरू:**
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

## 🛠️ समस्या समाधान उपकरणहरू र कमाण्डहरू

### डिबग कमाण्डहरू
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

### लग विश्लेषण
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### स्रोत अनुसन्धान
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 थप सहयोग प्राप्त गर्दै

### कहिले बढाउने
- सबै समाधान प्रयास गरेपछि प्रमाणीकरण समस्याहरू जारी रहन्छ
- Azure सेवाहरूको साथ पूर्वाधार समस्याहरू
- बिलिङ वा सब्सक्रिप्शन सम्बन्धित समस्याहरू
- सुरक्षा चिन्ता वा घटनाहरू

### सहयोग च्यानलहरू
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

### संकलन गर्नुपर्ने जानकारी
सहयोग सम्पर्क गर्नु अघि, संकलन गर्नुहोस्:
- `azd version` आउटपुट
- `azd info` आउटपुट
- त्रुटि सन्देशहरू (पूर्ण पाठ)
- समस्या पुन: उत्पन्न गर्न चरणहरू
- वातावरण विवरणहरू (`azd env show`)
- समस्या सुरु भएको समयरेखा

### लग संकलन स्क्रिप्ट
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

### प्रि-डिप्लोयमेन्ट चेकलिस्ट
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

### नियमित मर्मत
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## सम्बन्धित स्रोतहरू

- [डिबगिङ गाइड](debugging.md) - उन्नत डिबगिङ प्रविधिहरू
- [स्रोतहरू प्रावधान गर्दै](../deployment/provisioning.md) - पूर्वाधार समस्या समाधान
- [क्षमता योजना](../pre-deployment/capacity-planning.md) - स्रोत योजना मार्गदर्शन
- [SKU चयन](../pre-deployment/sku-selection.md) - सेवा स्तर सिफारिसहरू

---

**सुझाव**: यो गाइड बुकमार्क गरेर राख्नुहोस् र जब तपाईं समस्याहरू सामना गर्नुहुन्छ तब यसलाई सन्दर्भ गर्नुहोस्। अधिकांश समस्याहरू पहिले देखिएका छन् र स्थापित समाधानहरू छन्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [स्रोतहरू प्रावधान गर्दै](../deployment/provisioning.md)
- **अर्को पाठ**: [डिबगिङ गाइड](debugging.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छ। यसको मूल भाषा मा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।