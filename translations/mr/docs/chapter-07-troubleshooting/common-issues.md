# सामान्य समस्या आणि निराकरणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: अध्याय 7 - समस्या सोडवणे आणि डीबगिंग
- **⬅️ मागील अध्याय**: [अध्याय 6: प्री-फ्लाइट तपासण्या](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ पुढील**: [डीबगिंग मार्गदर्शक](debugging.md)
- **🚀 पुढील अध्याय**: [अध्याय 8: उत्पादन आणि एंटरप्राइझ नमुने](../chapter-08-production/production-ai-practices.md)

## परिचय

हा संपूर्ण समस्या सोडवण्याचा मार्गदर्शक Azure Developer CLI वापरताना सर्वात जास्त आढळणाऱ्या समस्यांवर आधारित आहे. प्रमाणीकऱण, तैनाती, पायाभूत सुविधा पुरवठा आणि अनुप्रयोग संरचनेशी संबंधित सामान्य समस्यांचे निदान, समस्या निवारण आणि निराकरण कसे करावे हे शिकाअ। प्रत्येक समस्येसह सविस्तर लक्षणे, मुळ कारणे आणि पायरी-दर-पायरी निराकरण प्रक्रिया दिल्या आहेत.

## अभ्यासाचे उद्दिष्टे

हा मार्गदर्शक पूर्ण केल्यानंतर, आपण:
- Azure Developer CLI समस्यांसाठी निदान तंत्रज्ञानात पारंगत व्हाल
- सामान्य प्रमाणीकरण आणि अनुमती समस्यांसह त्यांचे निराकरण समजून घ्याल
- तैनाती अपयश, पायाभूत सुविधा पुरवठा त्रुटी आणि संरचना समस्या सोडवू शकाल
- सक्रिय निरीक्षण आणि डीबगिंग धोरणे राबवाल
- गुंतागुंतीच्या समस्यांसाठी सुसंगत समस्या निवारण पद्धती वापराल
- भविष्यातील समस्या टाळण्यासाठी योग्य लॉगिंग आणि निरीक्षण संरचीत कराल

## शिकलेल्या गोष्टींचे निकाल

पूर्ण केल्यानंतर, आपण सक्षम असाल:
- अंगभूत निदान साधने वापरून Azure Developer CLI समस्या ओळखणे
- प्रमाणीकरण, सदस्यता, आणि अनुमती-संबंधित समस्या स्वतंत्रपणे सोडवणे
- तैनाती अपयश आणि पायाभूत सुविधा पुरवठा त्रुटी प्रभावीपणे दुरुस्त करणे
- अनुप्रयोग संरचना समस्या आणि वातावरण-विशिष्ट समस्या डीबग करणे
- संभाव्य समस्या सक्रियपणे ओळखण्यासाठी निरीक्षण आणि अॅलर्टिंग योजनेची अंमलबजावणी करणे
- लॉगिंग, डीबगिंग आणि समस्या निराकरण कार्यप्रवाहासाठी सर्वोत्तम पद्धती लागू करणे

## जलद निदान

> उदाहरण नावे/आयडी आपल्या वातावरणातील मूल्यांनी बदला. Bash, Bicep, JavaScript आणि पॅरामीटर-फाईलचे तुकडे वेगळ्या लेबलसह दिले आहेत; हे एक executable स्क्रिप्ट नाहीत. विध्वंसकारी ऑपरेशन्स तपासा आणि गुपिते सामायिक करण्यापूर्वी गुपितांवर पट्टी लावा. `azd monitor --logs` ब्राउझर उघडतो; टर्मिनल लॉग्स नाहीत.

विशिष्ट समस्यांमध्ये जाऊन आधी, खालील आज्ञा चालवा ज्यामुळे निदान माहिती जमा होईल:

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

## प्रमाणीकरण समस्या

### समस्या: "अ‍ॅक्सेस टोकन मिळवण्यात अयशस्वी"
**लक्षणे:**
- `azd up` प्रमाणीकरण त्रुटींसह अयशस्वी होते
- आज्ञा "अनधिकृत" किंवा "अ‍ॅक्सेस नाकारले" परत करतात

**निराकरणे:**
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

### समस्या: तैनाती दरम्यान "तयारी पुरेशी नाही" त्रुटी
**लक्षणे:**
- अनुमती त्रुटींसह तैनाती अयशस्वी होते
- विशिष्ट Azure संसाधने तयार करता येत नाहीत

**निराकरणे:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### समस्या: बहु-भाड्यांकाशी प्रमाणीकरण समस्या
**निराकरणे:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ पायाभूत सुविधा पुरवठा त्रुटी

### समस्या: संसाधन नावांमध्ये संघर्ष
**लक्षणे:**
- "संसाधन नाव आधीपासून अस्तित्वात आहे" त्रुट्या
- संसाधन निर्मिती दरम्यान तैनाती अयशस्वी होते

**निराकरणे:**
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

### समस्या: स्थान/क्षेत्र उपलब्ध नाही
**लक्षणे:**
- "xyz स्थान हा संसाधन प्रकारासाठी उपलब्ध नाही" त्रुटी
- निवडलेल्या प्रदेशात काही SKU उपलब्ध नाहीत

**निराकरणे:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

स्थान बदलल्याने विद्यमान संसाधने स्थलांतरित होत नाहीत. विद्यमान संसाधन समूह किंवा संसाधन स्थान बदल नाकारू शकते; प्रादेशिक पुन:तैनातीसाठी स्वतंत्र वातावरण वापरा.

### समस्या: कोटाच्या मर्यादा ओलांडल्या गेल्या
**लक्षणे:**
- "संसाधन प्रकारासाठी कोटा ओलांडला"
- "संसाधनांची कमाल संख्या गाठली"

**निराकरणे:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

विकासासाठी, `infra/main.parameters.json` मध्ये समर्थन असलेला लहान SKU निवडा:

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

### समस्या: Bicep टेम्पलेट त्रुटी
**लक्षणे:**
- टेम्पलेट प्रमाणीकरण अयशस्वी
- Bicep फाइल्समध्ये व्याकरण त्रुटी

**निराकरणे:**
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

## 🚀 तैनाती अपयश

### समस्या: बिल्ड अपयश
**लक्षणे:**
- अनुप्रयोग तैनातीदरम्यान बिल्ड होणे अयशस्वी होते
- पॅकेज इन्स्टॉलेशन त्रुटी

**निराकरणे:**
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

### समस्या: कंटेनर तैनाती अपयश
**लक्षणे:**
- कंटेनर अनुप्रयोग सुरू होऊ शकत नाहीत
- इमेज पुल त्रुटी

**निराकरणे:**
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

### समस्या: डेटाबेस कनेक्शन अपयश
**लक्षणे:**
- अनुप्रयोग डेटाबेसशी कनेक्ट होऊ शकत नाही
- कनेक्शन टाइमआउट त्रुटी

**निराकरणे:**
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

## 🔧 संरचना समस्या

### समस्या: पर्यावरणीय चल कार्य करत नाहीत
**लक्षणे:**
- अनुप्रयोग संरचना मूल्ये वाचू शकत नाही
- पर्यावरणीय चल रिक्त दिसतात

**निराकरणे:**
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

### समस्या: SSL/TLS प्रमाणपत्र समस्या
**लक्षणे:**
- HTTPS कार्यरत नाही
- प्रमाणपत्र प्रमाणीकरण त्रुटी

**निराकरणे:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### समस्या: CORS संरचना समस्या
**लक्षणे:**
- फ्रंटेंड API कॉल करू शकत नाही
- क्रॉस-ओरिजिन विनंती अडवली गेली

**निराकरणे:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. आपला विद्यमान Express अनुप्रयोग (बार केलेले `cors` सह) अद्यतनित करा:

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

## 🌍 पर्यावरण व्यवस्थापन समस्या

### समस्या: पर्यावरण स्विचिंग समस्या
**लक्षणे:**
- चुकीचे पर्यावरण वापरले जात आहे
- संरचना योग्यरित्या स्विच होत नाही

**निराकरणे:**
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
**लक्षणे:**
- पर्यावरण अमान्य स्थितीत दिसते
- संसाधने संरचनेशी जुळत नाहीत

**निराकरणे:**
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

## 🔍 कार्यक्षमता समस्या

### समस्या: हळू तैनाती वेळा
**लक्षणे:**
- तैनाती खूप वेळ घेत आहे
- तैनाती दरम्यान टाइमआउट होते

**निराकरणे:**
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

### समस्या: अनुप्रयोग कार्यक्षमता समस्या
**लक्षणे:**
- प्रतिसाद वेळा हळू आहेत
- संसाधन वापर जास्त

**निराकरणे:**
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

## 🛠️ समस्या निवारण साधने आणि आज्ञा

### डीबग आज्ञा
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

### संसाधन तपासणी
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 अतिरिक्त मदत मिळविणे

### केव्हां संपर्क साधावा
- सर्व निराकरणे करूनही प्रमाणीकरण समस्या कायम आहेत
- Azure सेवांमधील पायाभूत सुविधा समस्या
- बिलिंग किंवा सदस्यता-संबंधित समस्या
- सुरक्षा चिंता किंवा घटना

### समर्थन चॅनेल्स
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

### गोळा करावयाची माहिती
समर्थन संपर्क करण्यापूर्वी, जमा करा:
- `azd version` आउटपुट
- `azd config show` आउटपुट
- `azd show` आउटपुट (सध्याचा तैनाती स्थिती)
- त्रुटी संदेश (संपूर्ण मजकूर)
- समस्या पुन्हा एकदा कशी घडवून आणायची ते चरण
- गुपिते असलेली अदृश्य केलेली पर्यावरण तपशील (कच्चे `azd env get-values` कधीही शेअर करू नका)
- समस्या सुरू झाल्याचा कालमर्यादा

### लॉग गोळा करण्याचा स्क्रिप्ट
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

## 📊 समस्या प्रतिबंध

### पूर्व-तैनाती तपासणी यादी
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

### निरीक्षण सेटअप
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

### नियमित देखभाल
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## संबंधित संसाधने

- [डीबगिंग मार्गदर्शक](debugging.md) - प्रगत डीबगिंग तंत्रज्ञान
- [पुरवठा संसाधने](../chapter-04-infrastructure/provisioning.md) - पायाभूत सुविधा समस्या निवारण
- [क्षमता नियोजन](../chapter-06-pre-deployment/capacity-planning.md) - संसाधन नियोजन मार्गदर्शन
- [SKU निवड](../chapter-06-pre-deployment/sku-selection.md) - सेवा स्तर शिफारसी

---

**टीप**: हा मार्गदर्शक बुकमार्क करा आणि समस्या आढळल्यास त्याचा संदर्भ घ्या. बहुतेक समस्या आधी पाहिल्या गेल्या आहेत आणि त्यांच्या निराकरणे स्थिर आहेत!

---

**नेव्हिगेशन**
- **मागील धडा**: [पुरवठा संसाधने](../chapter-04-infrastructure/provisioning.md)
- **पुढील धडा**: [डीबगिंग मार्गदर्शक](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->