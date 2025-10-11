<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-10-11T16:00:20+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ta"
}
-->
# பொதுவான பிரச்சினைகள் மற்றும் தீர்வுகள்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 7 - பிழைதிருத்தம் மற்றும் பிழை கண்டறிதல்
- **⬅️ முந்தைய அத்தியாயம்**: [அத்தியாயம் 6: பறப்பதற்கு முன் சரிபார்ப்பு](../pre-deployment/preflight-checks.md)
- **➡️ அடுத்தது**: [பிழைதிருத்த வழிகாட்டி](debugging.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 8: உற்பத்தி மற்றும் நிறுவன வடிவங்கள்](../ai-foundry/production-ai-practices.md)

## அறிமுகம்

இந்த விரிவான பிழைதிருத்த வழிகாட்டி Azure Developer CLI பயன்படுத்தும்போது அடிக்கடி எதிர்கொள்ளப்படும் பிரச்சினைகளை உள்ளடக்கியது. அங்கீகாரம், பிரசாரங்கள், உள்கட்டமைப்பு வழங்கல் மற்றும் பயன்பாட்டு அமைப்பில் ஏற்படும் பொதுவான பிரச்சினைகளை கண்டறிந்து, தீர்வு காணவும், சரிசெய்யவும் கற்றுக்கொள்ளுங்கள். ஒவ்வொரு பிரச்சினைக்கும் விரிவான அறிகுறிகள், அடிப்படை காரணங்கள் மற்றும் படிப்படியாக தீர்வு செயல்முறைகள் உள்ளன.

## கற்றல் இலக்குகள்

இந்த வழிகாட்டியை முடிக்கும்போது, நீங்கள்:
- Azure Developer CLI பிரச்சினைகளுக்கான கண்டறிதல் நுட்பங்களை கற்றுக்கொள்வீர்கள்
- பொதுவான அங்கீகாரம் மற்றும் அனுமதி பிரச்சினைகள் மற்றும் அவற்றின் தீர்வுகளை புரிந்துகொள்வீர்கள்
- பிரசார தோல்விகள், உள்கட்டமைப்பு வழங்கல் பிழைகள் மற்றும் அமைப்பு பிரச்சினைகளை சரிசெய்வீர்கள்
- முன்னோடியாக கண்காணிப்பு மற்றும் பிழைதிருத்த உத்திகளை செயல்படுத்துவீர்கள்
- சிக்கலான பிரச்சினைகளுக்கு முறையான பிழைதிருத்த முறைமைகளை பயன்படுத்துவீர்கள்
- எதிர்கால பிரச்சினைகளைத் தவிர்க்க சரியான பதிவு மற்றும் கண்காணிப்பை அமைப்பீர்கள்

## கற்றல் முடிவுகள்

முடித்தவுடன், நீங்கள்:
- Azure Developer CLI பிரச்சினைகளை உள்ளமைக்கப்பட்ட கண்டறிதல் கருவிகளைப் பயன்படுத்தி கண்டறிய முடியும்
- அங்கீகாரம், சந்தா மற்றும் அனுமதி தொடர்பான பிரச்சினைகளை சுயமாக தீர்க்க முடியும்
- பிரசார தோல்விகள் மற்றும் உள்கட்டமைப்பு வழங்கல் பிழைகளை திறமையாக சரிசெய்ய முடியும்
- பயன்பாட்டு அமைப்பு பிரச்சினைகள் மற்றும் சூழல் சார்ந்த பிரச்சினைகளை பிழைதிருத்த முடியும்
- சாத்தியமான பிரச்சினைகளை முன்னோடியாக அடையாளம் காண கண்காணிப்பு மற்றும் எச்சரிக்கைகளை செயல்படுத்த முடியும்
- பதிவு, பிழைதிருத்தம் மற்றும் பிரச்சினை தீர்வு பணிமுறைகளுக்கான சிறந்த நடைமுறைகளைப் பயன்படுத்த முடியும்

## விரைவான கண்டறிதல்

குறிப்பிட்ட பிரச்சினைகளில் இறங்குவதற்கு முன், இந்த கட்டளைகளை இயக்கி கண்டறிதல் தகவலை சேகரிக்கவும்:

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

## அங்கீகாரம் தொடர்பான பிரச்சினைகள்

### பிரச்சினை: "அங்கீகார டோக்கனை பெற முடியவில்லை"
**அறிகுறிகள்:**
- `azd up` அங்கீகாரம் பிழைகளுடன் தோல்வியடைகிறது
- கட்டளைகள் "அங்கீகாரம் இல்லை" அல்லது "அனுமதி மறுக்கப்பட்டது" என திருப்புகிறது

**தீர்வுகள்:**
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

### பிரச்சினை: "பிரசாரத்தின் போது போதுமான அனுமதிகள் இல்லை"
**அறிகுறிகள்:**
- அனுமதி பிழைகளுடன் பிரசாரம் தோல்வியடைகிறது
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

### பிரச்சினை: பல-தொகுதி அங்கீகாரம் தொடர்பான பிரச்சினைகள்
**தீர்வுகள்:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ உள்கட்டமைப்பு வழங்கல் பிழைகள்

### பிரச்சினை: வள பெயர் மோதல்கள்
**அறிகுறிகள்:**
- "வள பெயர் ஏற்கனவே உள்ளது" பிழைகள்
- வள உருவாக்கத்தின் போது பிரசாரம் தோல்வியடைகிறது

**தீர்வுகள்:**
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

### பிரச்சினை: இடம்/பகுதி கிடைக்கவில்லை
**அறிகுறிகள்:**
- "வள வகைக்கு 'xyz' இடம் கிடைக்கவில்லை"
- தேர்ந்தெடுக்கப்பட்ட பகுதியில் சில SKUs கிடைக்கவில்லை

**தீர்வுகள்:**
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

### பிரச்சினை: ஒதுக்கீடு மீறல் பிழைகள்
**அறிகுறிகள்:**
- "வள வகைக்கு ஒதுக்கீடு மீறப்பட்டது"
- "அதிகபட்ச வள எண்ணிக்கை அடைந்தது"

**தீர்வுகள்:**
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

### பிரச்சினை: Bicep டெம்ப்ளேட் பிழைகள்
**அறிகுறிகள்:**
- டெம்ப்ளேட் சரிபார்ப்பு தோல்விகள்
- Bicep கோப்புகளில் இலக்கண பிழைகள்

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

## 🚀 பிரசார தோல்விகள்

### பிரச்சினை: கட்டமைப்பு தோல்விகள்
**அறிகுறிகள்:**
- பிரசாரத்தின் போது பயன்பாடு கட்டமைக்க முடியவில்லை
- தொகுப்பு நிறுவல் பிழைகள்

**தீர்வுகள்:**
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

### பிரச்சினை: கன்டெய்னர் பிரசார தோல்விகள்
**அறிகுறிகள்:**
- கன்டெய்னர் பயன்பாடுகள் தொடங்க முடியவில்லை
- படத்தை இழுக்கும் பிழைகள்

**தீர்வுகள்:**
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

### பிரச்சினை: தரவுத்தொகுப்பு இணைப்பு தோல்விகள்
**அறிகுறிகள்:**
- பயன்பாடு தரவுத்தொகுப்புடன் இணைக்க முடியவில்லை
- இணைப்பு நேரம் முடிவடையும் பிழைகள்

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

## 🔧 அமைப்பு பிரச்சினைகள்

### பிரச்சினை: சூழல் மாறிகள் வேலை செய்யவில்லை
**அறிகுறிகள்:**
- பயன்பாடு அமைப்பு மதிப்புகளைப் படிக்க முடியவில்லை
- சூழல் மாறிகள் காலியாக தோன்றுகின்றன

**தீர்வுகள்:**
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

### பிரச்சினை: SSL/TLS சான்றிதழ் பிரச்சினைகள்
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

### பிரச்சினை: CORS அமைப்பு பிரச்சினைகள்
**அறிகுறிகள்:**
- முன்பக்கம் API-ஐ அழைக்க முடியவில்லை
- குறுக்குவழி கோரிக்கை மறுக்கப்பட்டது

**தீர்வுகள்:**
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

## 🌍 சூழல் மேலாண்மை பிரச்சினைகள்

### பிரச்சினை: சூழல் மாறுதல் பிரச்சினைகள்
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
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### பிரச்சினை: சூழல் அழுகல்
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

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 செயல்திறன் பிரச்சினைகள்

### பிரச்சினை: மெதுவான பிரசார நேரங்கள்
**அறிகுறிகள்:**
- பிரசாரங்கள் மிகவும் நீண்ட நேரம் எடுக்கின்றன
- பிரசாரத்தின் போது நேரம் முடிவடைகிறது

**தீர்வுகள்:**
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

### பிரச்சினை: பயன்பாட்டு செயல்திறன் பிரச்சினைகள்
**அறிகுறிகள்:**
- மெதுவான பதில் நேரங்கள்
- அதிக வள பயன்பாடு

**தீர்வுகள்:**
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

## 🛠️ பிழைதிருத்த கருவிகள் மற்றும் கட்டளைகள்

### பிழைதிருத்த கட்டளைகள்
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

### பதிவு பகுப்பாய்வு
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### வள விசாரணை
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 கூடுதல் உதவி பெறுதல்

### எப்போது உயர்த்த வேண்டும்
- அனைத்து தீர்வுகளை முயற்சித்த பிறகும் அங்கீகாரம் தொடர்பான பிரச்சினைகள் தொடர்கின்றன
- Azure சேவைகளுடன் உள்கட்டமைப்பு பிரச்சினைகள்
- பில்லிங் அல்லது சந்தா தொடர்பான பிரச்சினைகள்
- பாதுகாப்பு கவலைகள் அல்லது சம்பவங்கள்

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
ஆதரவை தொடர்பு கொள்ளும் முன், சேகரிக்க:
- `azd version` வெளியீடு
- `azd info` வெளியீடு
- பிழை செய்திகள் (முழு உரை)
- பிரச்சினையை உருவாக்குவதற்கான படிகள்
- சூழல் விவரங்கள் (`azd env show`)
- பிரச்சினை தொடங்கிய நேரகாலம்

### பதிவு சேகரிப்பு ஸ்கிரிப்ட்
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

## 📊 பிரச்சினை தடுப்பு

### பிரசாரத்திற்கு முன் சரிபார்ப்பு பட்டியல்
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

### வழக்கமான பராமரிப்பு
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## தொடர்புடைய வளங்கள்

- [பிழைதிருத்த வழிகாட்டி](debugging.md) - மேம்பட்ட பிழைதிருத்த நுட்பங்கள்
- [வளங்களை வழங்குதல்](../deployment/provisioning.md) - உள்கட்டமைப்பு பிழைதிருத்தம்
- [திறன் திட்டமிடல்](../pre-deployment/capacity-planning.md) - வள திட்டமிடல் வழிகாட்டுதல்
- [SKU தேர்வு](../pre-deployment/sku-selection.md) - சேவை நிலை பரிந்துரைகள்

---

**குறிப்பு**: இந்த வழிகாட்டியை புத்தகக்குறியாக வைத்துக்கொண்டு, பிரச்சினைகளை எதிர்கொள்ளும் போது அதைப் பார்க்கவும். பெரும்பாலான பிரச்சினைகள் ஏற்கனவே காணப்பட்டு, தீர்வுகள் நிறுவப்பட்டுள்ளன!

---

**வழிசெலுத்தல்**
- **முந்தைய பாடம்**: [வளங்களை வழங்குதல்](../deployment/provisioning.md)
- **அடுத்த பாடம்**: [பிழைதிருத்த வழிகாட்டி](debugging.md)

---

**குறிப்பு**:  
இந்த ஆவணம் [Co-op Translator](https://github.com/Azure/co-op-translator) என்ற AI மொழிபெயர்ப்பு சேவையைப் பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கின்றோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கக்கூடும் என்பதை தயவுசெய்து கவனத்தில் கொள்ளுங்கள். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.