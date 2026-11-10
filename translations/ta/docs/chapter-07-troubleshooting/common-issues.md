# பொதுவான சிக்கல்கள் மற்றும் தீர்வுகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி தலைமையகம்**: [AZD தொடக்கக்காரர்களுக்கானது](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைத்திருத்தம் மற்றும் பிழைகாணுதல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 6: முன் பறக்கும் பரிசோதனைகள்](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ அடுத்தது**: [பிழைகாணும் கையேடு](debugging.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: தயாரிப்பு மற்றும் நிறுவன மாதிரிகள்](../chapter-08-production/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான பிழைத்திருத்த கையேடு Azure Developer CLI பயன்படுத்தப்படும்போது பொதுவாக எதிர்கொள்ளப்படும் பிரச்சனைகளை சேர்ந்தது. அங்கீகார, நிலைநிறுத்தம், அடிப்படை உபகரணங்கள் வழங்கல் மற்றும் பயன்பாட்டு அமைப்பு சார்ந்த பொதுவான சிக்கல்களை கண்டறிந்து, பிழைத்திருத்தி, தீர்வுகளை கற்றுக்கொள்ளவும். ஒவ்வொரு சிக்கலும் விரிவான அறிகுறிகள், முதன்மை காரணங்கள் மற்றும் படிப்படியாக தீர்வு நடைமுறைகளை உள்ளடக்கியது.

## கற்றல் இலக்குகள்

இந்த கையேட்டை முடித்த பிறகு, நீங்கள்:
- Azure Developer CLI குறுக்குவழி சிக்கல்களை நிர்வகிப்பதற்கான நிபுணத்துவங்களை கற்று கொள்வீர்கள்
- பொதுவான அங்கீகார மற்றும் அனுமதி பிரச்சனைகள் மற்றும் அவற்றின் தீர்வுகளை புரிந்து கொள்வீர்கள்
- நிலைநிறுத்த தோல்விகள், அடிப்படை உபகரணங்களின் பிழைகள் மற்றும் அமைப்பு சிக்கல்களை தீர்க்கும் திறனை பெறுவீர்கள்
- முன்னெச்சரிக்கை கண்காணிப்பு மற்றும் பிழைகாணும் வித்தியாசங்களை செயல்படுத்துவீர்கள்
- சிக்கலான பிரச்சனைகளுக்கு அமைக்கப்பட்ட முறையாக பிழைத்திருத்த முறைமைகளை பயன்படுத்துவீர்கள்
- எதிர்கால சிரமங்களை தடுக்கும் வகையில் சரியான பதிவேற்றம் மற்றும் கண்காணிப்பை அமைப்பீர்கள்

## கற்றல் விளைவுகள்

முடித்தவுடன், நீங்கள் செய்யக்கூடியவைகள்:
- Azure Developer CLI சிக்கல்களை உள்ளமைந்த ஆய்வு கருவிகள் மூலம் கண்டறிதல்
- அங்கீகார, சந்தா மற்றும் அனுமதி குறைபாடுகளை தனிப்பட்ட முறையில் தீர்க்குதல்
- நிலைநிறுத்த தோல்விகள் மற்றும் அடிப்படை உபகரண பிழைகளை திறம்பட பிழைத்திருத்தல்
- பயன்பாட்டு அமைப்பு மற்றும் சுற்றுச்சூழல் சார்ந்த பிரச்சனைகளை பிழைகாணுதல்
- சாத்தியப்பட்ட சிக்கல்களை முன்னெச்சரிக்கையுடன் கண்டறியும் கண்காணிப்பு மற்றும் அலர்ட் அமைப்பை செயல்படுத்தல்
- பதிவு, பிழைத்திருத்தம் மற்றும் பிரச்சனை தீர்வு வேலைப்பாடுகளுக்கு சிறந்த நடைமுறைகளை பயன்படுத்துதல்

## வேகமான பரிசோதனைகள்

> உங்கள் சூழலின் மதிப்புகளுடன் உதாரண பெயர்கள்/அடையாளங்கள் மாற்றவும். பாஷ், பைசெப், ஜாவாஸ்கிரிப்ட் மற்றும் அளவுரு-கோப்பு துணுக்குகள் கீழே தனித்தனியாக குறிக்கப்பட்டுள்ளன; அவை ஒரே நடைமுறை கோப்பாக இல்லை. அழிப்பு செயல்பாடுகளை சோதித்து, ரகசியங்களை பகிர்வதற்கு முன் மறைக்கவும். `azd monitor --logs` ஒரு உலாவியை திறக்கிறது; it does not stream terminal logs.

குறிப்பிட்ட சிக்கல்களில் இறங்குவதற்குமுன், பின்வரும் கட்டளைகளை இயக்கி பரிசோதனைத் தகவல்களை சேகரிக்கவும்:

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

## அங்கீகார சிக்கல்கள்

### சிக்கல்: "அணுகல் டோக்கன் பெற தோல்வி"
**அறிகுறிகள்:**
- `azd up` அங்கீகார பிழைகளுடன் தோல்வியடைகிறது
- கட்டளைகள் "அனுமதி இல்லாதது" அல்லது "அணுகல் மறுக்கப்பட்டது" என திரும்புகின்றன

**தீர்வுகள்:**
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

### சிக்கல்: "மிக குறைவான பிரிவுரிமைகள்" நிலைநிறுத்தத்தின் போது
**அறிகுறிகள்:**
- நிலைநிறுத்தம் அனுமதி பிழைகளுடன் தோல்வியடைகிறது
- சில Azure வளங்களை உருவாக்க முடியவில்லை

**தீர்வுகள்:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### சிக்கல்: பன்முக அங்கீகாரப் பிரச்சனைகள்
**தீர்வுகள்:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ அடிப்படை உபகரண வழங்கல் பிழைகள்

### சிக்கல்: வள பெயர் மோதல்கள்
**அறிகுறிகள்:**
- "வள பெயர் ஏற்கனவே உள்ளது" பிழைகள்
- வள உருவாக்கும் போது நிலைநிறுத்தம் தோல்வியடைகிறது

**தீர்வுகள்:**
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

### சிக்கல்: இடம்/பிராந்தியம் கிடைக்கவில்லை
**அறிகுறிகள்:**
- "'xyz' இடம் அந்த வள வகைக்கு கிடைக்கவில்லை" என பிழை
- தேர்ந்தெடுக்கப்பட்ட பகுதியில் சில SKUகள் கிடைக்கவில்லை

**தீர்வுகள்:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

இடம் மாறுபாடு பழைய வளங்களைக் கடத்தாது. ஒரு உள்ளமைவான வள குழு அல்லது வள இடம் மாற்றத்தை மறுக்கும்; பிராந்திய மீள்நிலைநிறுத்தத்திற்கு தனி சூழலைப் பயன்படுத்தவும்.

### சிக்கல்: அளவு மீறிய பிழைகள்
**அறிகுறிகள்:**
- "வள வகைக்கு அளவு மீறப்பட்டது"
- "அதிகபட்ச வள எண்ணிக்கை சென்றடைந்தது"

**தீர்வுகள்:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

மேம்பாட்டுக்காக, `infra/main.parameters.json` இல் ஆதரவான சிறிய SKUயை தேர்வு செய்யவும்:

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

### சிக்கல்: பைசெப் மாதிரி பிழைகள்
**அறிகுறிகள்:**
- மாதிரி செல்லுபடியாகுவில் தோல்விகள்
- பைசெப் கோப்புகளில் இலக்கண பிழைகள்

**தீர்வுகள்:**
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

## 🚀 நிலைநிறுத்த தோல்விகள்

### சிக்கல்: கட்டமைப்பு தோல்விகள்
**அறிகுறிகள்:**
- நிலைநிறுத்தத்தின்போது பயன்பாடு கட்டமைப்பில் தோல்வி
- தொகுப்பு நிறுவல் பிழைகள்

**தீர்வுகள்:**
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

### சிக்கல்: கட்டுணரக நிலைநிறுத்த தோல்விகள்
**அறிகுறிகள்:**
- கட்டுணரக பயன்பாடுகள் தொடங்கவில்லை
- படிமம் இழுக்கும் பிழைகள்

**தீர்வுகள்:**
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

### சிக்கல்: தரவுத்தள இணைப்பு தோல்விகள்
**அறிகுறிகள்:**
- பயன்பாடு தரவுத்தளத்துடன் இணைக்க முடியவில்லை
- இணைப்பு நேரக் கெடுதல் பிழைகள்

**தீர்வுகள்:**
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

## 🔧 அமைப்பு சிக்கல்கள்

### சிக்கல்: சுற்றுச்சூழல் மாறிலிகள் வேலை செய்யவில்லை
**அறிகுறிகள்:**
- பயன்பாடு கட்டமைப்புத் மதிப்புகளைப் பாகப்படுத்த முடியவில்லை
- சுற்றுச்சூழல் மாறிலிகள் வெற்றிடமாக தெரிகிறது

**தீர்வுகள்:**
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

### சிக்கல்: SSL/TLS சான்றிதழ் பிரச்சனைகள்
**அறிகுறிகள்:**
- HTTPS வேலை செய்யவில்லை
- சான்றிதழ் சரிபார்ப்பு பிழைகள்

**தீர்வுகள்:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### சிக்கல்: CORS அமைப்பு பிரச்சனைகள்
**அறிகுறிகள்:**
- முன்புறம் APIஐ அழைக்க முடியவில்லை
- குறுக்கு-மூல கோரிக்கை தடுப்பது

**தீர்வுகள்:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. உங்கள் உள்ளமைந்த Express பயன்பாட்டை (ஆறு `cors` இறக்குமதி செய்யப்பட்ட) மேம்படுத்தவும்:

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

## 🌍 சூழல் மேலாண்மை சிக்கல்கள்

### சிக்கல்: சூழல் மாறுதல் பிரச்சனைகள்
**அறிகுறிகள்:**
- தவறான சூழல் பயன்படுத்தப்படுகிறது
- அமைப்பு சரியாக மாறவில்லை

**தீர்வுகள்:**
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

### சிக்கல்: சூழல் அழிவு
**அறிகுறிகள்:**
- சூழல் தவறான நிலையை காட்டுகிறது
- வளங்கள் அமைப்புடன் பொருந்தவில்லை

**தீர்வுகள்:**
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

## 🔍 செயல்திறன் பிரச்சனைகள்

### சிக்கல்: மெதுவான நிலைநிறுத்த நேரம்
**அறிகுறிகள்:**
- நிலைநிறுத்தங்கள் மிக நீண்ட நேரம் கடக்கின்றன
- நிலைநிறுத்தத்தின் போது நேரக் குறைபாடு

**தீர்வுகள்:**
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

### சிக்கல்: பயன்பாட்டு செயல்திறன் பிரச்சனைகள்
**அறிகுறிகள்:**
- மெதுவான பதிலளிப்பு நேரங்கள்
- அதிக வள உபயோகம்

**தீர்வுகள்:**
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

## 🛠️ பிழைத்திருத்த கருவிகள் மற்றும் கட்டளைகள்

### பிழைகாணும் கட்டளைகள்
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

### பதிவு பகுப்பாய்வு
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

### வள ஆய்வு
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 மேலதிக உதவி பெறுதல்

### எப்போது உயர்த்த வேண்டும்
- அனைத்து தீர்வுகளையும் முயன்ற பின்னர் அங்கீகார பிரச்சனைகள் தொடரும் போது
- Azure சேவைகளுடன் அடிப்படை பிரச்சனைகள் உள்ள போது
- பில்லிங் அல்லது சந்தா சம்பந்தப்பட்ட பிரச்சனைகள்
- பாதுகாப்பு சார்ந்த கவலை அல்லது சம்பவங்கள்

### ஆதரவு சேனல்கள்
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

### சேகரிக்க வேண்டிய தகவல்
ஆதரவுக்காக தொடர்புகொள்ளும் முன்பு, பின்வரும் தகவல்களை சேகரிக்கவும்:
- `azd version` வெளியீடு
- `azd config show` வெளியீடு
- `azd show` வெளியீடு (தற்போதைய நிலைநிறுத்த நிலை)
- பிழை செய்திகள் (முழு உரை)
- சிக்கலைக் கண்டுபிடிக்கும் படி எடுத்த செயல்முறைகள்
- மறைக்கப்பட்ட சூழல் விவரங்கள் (மூல `azd env get-values` பகிரக்கூடாது, அது ரகசியங்களை கொண்டிருக்கலாம்)
- சிக்கல் ஆரம்பித்த நேர வரிசை

### பதிவு சேகரிப்பு ஸ்கிரிப்ட்
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

## 📊 சிக்கல் தடுப்பு

### நிலைநிறுத்த முன்னோட்ட பட்டியல்
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

### கண்காணிப்பு அமைப்பு
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

### அடிக்கடி பராமரிப்பு
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## தொடர்புடைய வளங்கள்

- [பிழைகாணும் கையேடு](debugging.md) - மேம்பட்ட பிழைத்திருத்த நுட்பங்கள்
- [வளங்கள் வழங்கல்](../chapter-04-infrastructure/provisioning.md) - அடிப்படை சேர்க்கை பிழைத்திருத்தம்
- [திறன் திட்டமிடல்](../chapter-06-pre-deployment/capacity-planning.md) - வள திட்டமிடல் வழிகாட்டி
- [SKU தேர்வு](../chapter-06-pre-deployment/sku-selection.md) - சேவை திரு பரிந்துரைகள்

---

**உதவி**: இந்த கையேடானை புத்தகக் குறியீட்டில் வைத்து, சிக்கல்களை நேர்ந்தால் எப்போதும் அணுகி பாருங்கள். பெரும்பாலான பிரச்சனைகள் முன் பார்த்துள்ளன மற்றும் தீர்வு வழிமுறைகள் உள்ளன!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [வளங்கள் வழங்கல்](../chapter-04-infrastructure/provisioning.md)
- **அடுத்த பாடம்**: [பிழைகாணும் கையேடு](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->