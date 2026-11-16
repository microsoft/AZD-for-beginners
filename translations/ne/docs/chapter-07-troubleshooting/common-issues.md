# सामान्य समस्याहरू र समाधानहरू

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहस्थान**: [AZD सुरूत्या लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय ७ - समस्या समाधान र डिबगिङ
- **⬅️ अघिल्लो अध्याय**: [अध्याय ६: प्री-फ्लाइट चेकहरू](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ अर्को**: [डिबगिङ गाइड](debugging.md)
- **🚀 अर्को अध्याय**: [अध्याय ८: उत्पादन र उद्यम ढाँचा](../chapter-08-production/production-ai-practices.md)

## परिचय

यो व्यापक समस्या समाधान गाइडले Azure डेवलपर CLI प्रयोग गर्दा सबैभन्दा प्रायः देखिने समस्याहरू समेट्छ। प्रमाणीकरण, डिप्लोयमेन्ट, पूर्वाधार प्रबन्ध, र एप्लिकेशन कन्फिगरेसनका सामान्य समस्याहरूलाई कसरी निदान गर्ने, समस्या समाधान गर्ने, र समाधान गर्ने सिक्नुहोस्। प्रत्येक समस्यामा विस्तृत लक्षणहरू, मूल कारणहरू, र चरण-द्वारा-चरण समाधान प्रक्रिया समावेश छन्।

## सिकाई लक्ष्यहरू

यस गाइड पूरा गरेपछि, तपाईंले:
- Azure डेवलपर CLI समस्याहरूको लागि निदान प्रविधिहरूमा महारथ हासिल गर्नुहुनेछ
- सामान्य प्रमाणीकरण र अनुमति समस्याहरू र तिनको समाधानहरू बुझ्नुहुनेछ
- डिप्लोयमेन्ट असफलताहरू, पूर्वाधार प्रबन्ध त्रुटिहरू, र कन्फिगरेसन समस्याहरू समाधान गर्नुहुनेछ
- सक्रिय निगरानी र डिबगिङ रणनीतिहरू लागू गर्नुहुनेछ
- जटिल समस्याहरूको लागि प्रणालीगत समस्या समाधान विधिहरू प्रयोग गर्नुहुनेछ
- भविष्यका समस्याहरू रोक्न उचित लगिङ र निगरानी कन्फिगर गर्नुहुनेछ

## सिकाइ नतिजाहरू

पूरा भएपछि, तपाईं सक्षम हुनुहुनेछ:
- बिल्ट-इन निदान उपकरणहरू प्रयोग गरेर Azure डेवलपर CLI समस्याहरू पहिचान गर्न
- प्रमाणीकरण, सदस्यता, र अनुमति सम्बन्धी समस्याहरू स्वतन्त्र रूपमा समाधान गर्न
- डिप्लोयमेन्ट असफलताहरू र पूर्वाधार प्रबन्ध त्रुटिहरू प्रभावकारी रूपमा समाधान गर्न
- एप्लिकेशन कन्फिगरेसन समस्याहरू र वातावरण-विशिष्ट समस्याहरू डिबग गर्न
- सम्भावित समस्याहरू सक्रिय रूपमा पहिचान गर्न निगरानी र चेतावनी कार्यान्वयन गर्न
- लगिङ, डिबगिङ र समस्या समाधान कार्यप्रवाहको लागि उत्तम अभ्यासहरू लागू गर्न

## छिटो निदान

> उदाहरण नाम/आईडीहरूलाई आफ्नो वातावरणका मानहरूसँग बदल्नुहोस्। Bash, Bicep, JavaScript, र प्यारामिटर-फाइल खण्डहरूलाई तल छुट्टै लेबल गरिएको छ; ती एउटै चल्ने स्क्रिप्ट होइनन्। विनाशकारी अपरेसनहरू समीक्षा गरेर गोप्य विवरणहरू छिपाउनुहोस्। `azd monitor --logs` ले ब्राउजर खोल्छ; यो टर्मिनल लगहरू स्ट्रिम गर्दैन।

विशिष्ट समस्याहरूमा टर्न गर्नु अघि, यी कमाण्डहरू चलाएर निदान जानकारी सङ्कलन गर्नुहोस्:

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

## प्रमाणीकरण समस्याहरू

### समस्या: "प्रवेश टोकन प्राप्त गर्न असफल"
**लक्षणहरू:**
- `azd up` प्रमाणीकरण त्रुटिहरूका साथ असफल हुन्छ
- कमाण्डहरू "अनधिकृत" वा "पहुँच अस्वीकृत" फर्काउँछन्

**समाधानहरू:**
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

### समस्या: डिप्लोयमेन्टको बेला "अपर्याप्त विशेषाधिकार"
**लक्षणहरू:**
- अनुमति त्रुटिहरूका साथ डिप्लोयमेन्ट असफल हुन्छ
- केही Azure स्रोतहरू सिर्जना गर्न सकिंदैन

**समाधानहरू:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: बहु-किरायादार प्रमाणीकरण समस्याहरू
**समाधानहरू:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ पूर्वाधार प्रबन्ध त्रुटिहरू

### समस्या: स्रोत नाम द्वन्द्व
**लक्षणहरू:**
- "स्रोत नाम पहिले नै अवस्थित छ" त्रुटिहरू
- स्रोत सिर्जनाकालमा डिप्लोयमेन्ट असफल हुन्छ

**समाधानहरू:**
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

### समस्या: स्थान/क्षेत्र उपलब्ध छैन
**लक्षणहरू:**
- "स्रोत प्रकारका लागि स्थान 'xyz' उपलब्ध छैन"
- छनोट गरिएको क्षेत्रमा निश्चित SKU हरू उपलब्ध छैनन्

**समाधानहरू:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

स्थान भेरिएबल परिवर्तनले अवस्थित स्रोतहरू सार्दैन। कुनै अवस्थित स्रोत समूह वा स्रोतले स्थान परिवर्तन अस्वीकार गर्न सक्छ; क्षेत्रीय पुन:डिप्लोमेन्टका लागि अलग वातावरण प्रयोग गर्नुहोस्।

### समस्या: कोटा ओभर गर्नुका त्रुटिहरू
**लक्षणहरू:**
- "स्रोत प्रकारका लागि कोटा बढी भयो"
- "अधिकतम स्रोत संख्या पुगेको"

**समाधानहरू:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

विकासको लागि, `infra/main.parameters.json` मा समर्थन गरिएको सानो SKU रोज्नुहोस्:

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

### समस्या: बाइसेप टेम्प्लेट त्रुटिहरू
**लक्षणहरू:**
- टेम्प्लेट मान्यता असफलताहरू
- Bicep फाइलहरूमा वाक्य विन्यास त्रुटिहरू

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

## 🚀 डिप्लोयमेन्ट असफलताहरू

### समस्या: बिल्ड असफलता
**लक्षणहरू:**
- डिप्लोयमेन्टको बेला एप्लिकेशन बिल्ड हुन सक्दैन
- प्याकेज स्थापना त्रुटिहरू

**समाधानहरू:**
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

### समस्या: कन्टेनर डिप्लोयमेन्ट असफलताहरू
**लक्षणहरू:**
- कन्टेनर एप्लिकेशनहरू सुरु हुन सक्दैनन्
- इमेज पुल त्रुटिहरू

**समाधानहरू:**
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

### समस्या: डाटाबेस कनेक्शन असफलताहरू
**लक्षणहरू:**
- एप्लिकेशन डाटाबेससँग कनेक्ट गर्न सक्दैन
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

### समस्या: वातावरण चर काम नगर्ने
**लक्षणहरू:**
- एपले कन्फिगरेसन मानहरू पढ्न सक्दैन
- वातावरण चरहरू खाली देखिन्छन्

**समाधानहरू:**
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

### समस्या: SSL/TLS प्रमाणपत्र समस्याहरू
**लक्षणहरू:**
- HTTPS काम नगर्ने
- प्रमाणपत्र प्रमाणीकरण त्रुटिहरू

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
- फ्रन्टएंडले API कल गर्न सक्दैन
- क्रस-ओरिजिन अनुरोध अवरुद्ध भयो

**समाधानहरू:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. तपाईंको अवस्थित Express एप्लिकेशन अपडेट गर्नुहोस् (सहित `cors` आयात गरिएको):

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

## 🌍 वातावरण प्रबंधन समस्याहरू

### समस्या: वातावरण स्विचिङ्ग समस्याहरू
**लक्षणहरू:**
- गलत वातावरण प्रयोग भइरहेको छ
- कन्फिगरेसन ठीकसँग स्विच हुँदैन

**समाधानहरू:**
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

### समस्या: वातावरण भ्रष्टाचार
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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 प्रदर्शन समस्याहरू

### समस्या: ढिलो डिप्लोयमेन्ट समयहरू
**लक्षणहरू:**
- डिप्लोयमेन्टहरू धेरै समय लिन्छन्
- डिप्लोयमेन्टको बेला टाइमआउटहरू

**समाधानहरू:**
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

### समस्या: एप्लिकेशन प्रदर्शन समस्याहरू
**लक्षणहरू:**
- सुस्त प्रतिक्रिया समयहरू
- उच्च स्रोत उपयोग

**समाधानहरू:**
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

## 🛠️ समस्या समाधान उपकरण र कमाण्डहरू

### डिबग कमाण्डहरू
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

### लग विश्लेषण
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

### स्रोत जाँच
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 थप सहयोग कसरी पाउने

### कहिले उन्नति गर्ने
- सबै समाधान प्रयासहरू पछि पनि प्रमाणीकरण समस्याहरू जारी
- Azure सेवाहरूमा पूर्वाधार समस्याहरू
- बिलिङ वा सदस्यता सम्बन्धी समस्याहरू
- सुरक्षा चिन्ताहरू वा घटनाहरू

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

### सङ्कलन गर्ने जानकारीहरू
सहयोग सम्पर्क गर्नु अघि, सङ्कलन गर्नुहोस्:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (चालु डिप्लोयमेन्ट स्थिति)
- त्रुटि सन्देशहरू (पूर्ण पाठ)
- समस्यालाई पुनरुत्पादन गर्ने चरणहरू
- गोप्य वातावरण विवरणहरू (कहिल्यै कच्चा `azd env get-values` साझेदारी नगर्नुहोस् जसले गोप्य जानकारी समावेश गर्न सक्छ)
- समस्याको सुरु हुने समयरेखा

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

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

### नियमित मर्मत
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## सम्बन्धित स्रोतहरू

- [डिबगिङ गाइड](debugging.md) - उन्नत डिबगिङ प्रविधिहरू
- [पूर्वाधार स्रोतहरू](../chapter-04-infrastructure/provisioning.md) - पूर्वाधार समस्या समाधान
- [क्षमता योजना](../chapter-06-pre-deployment/capacity-planning.md) - स्रोत योजना निर्देशन
- [SKU छनोट](../chapter-06-pre-deployment/sku-selection.md) - सेवा तह सिफारिसहरू

---

**सल्लाह**: यो गाइडलाई बुकमार्क राख्नुहोस् र जबसुकै समस्या आयो भने पुनः हेर्नुहोस्। धेरै समस्याहरू पहिले पनि देखिएका छन् र समाधानहरू स्थापित छन्!

---

**नेभिगेसन**
- **अघिल्लो पाठ**: [पूर्वाधार स्रोतहरू](../chapter-04-infrastructure/provisioning.md)
- **अर्को पाठ**: [डिबगिङ गाइड](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->