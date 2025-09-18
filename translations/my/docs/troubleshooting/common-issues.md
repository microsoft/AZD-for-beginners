<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-18T13:23:12+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "my"
}
-->
# အများဆုံးတွေ့ရသောပြဿနာများနှင့် ဖြေရှင်းနည်းများ

**အခန်းအကြောင်းအရာ:**
- **📚 သင်ခန်းစာအိမ်**: [AZD For Beginners](../../README.md)
- **📖 လက်ရှိအခန်း**: အခန်း ၇ - ပြဿနာရှာဖွေခြင်းနှင့် Debugging
- **⬅️ ယခင်အခန်း**: [အခန်း ၆: Pre-flight Checks](../pre-deployment/preflight-checks.md)
- **➡️ နောက်တစ်ခု**: [Debugging Guide](debugging.md)
- **🚀 နောက်အခန်း**: [အခန်း ၈: Production & Enterprise Patterns](../ai-foundry/production-ai-practices.md)

## အကျဉ်းချုပ်

ဒီပြဿနာရှာဖွေခြင်းလမ်းညွှန်မှာ Azure Developer CLI ကိုအသုံးပြုရာတွင် အများဆုံးတွေ့ရသောပြဿနာများကို ကူညီဖြေရှင်းပေးနိုင်ရန် ရည်ရွယ်ထားပါတယ်။ Authentication, Deployment, Infrastructure Provisioning, Application Configuration စတဲ့ပြဿနာများကို ရှာဖွေ၊ ဖြေရှင်းနည်းများကို လေ့လာနိုင်ပါမည်။ ပြဿနာတစ်ခုစီမှာ လက္ခဏာများ၊ အကြောင်းရင်းများနှင့် အဆင့်ဆင့်ဖြေရှင်းနည်းများ ပါဝင်ပါတယ်။

## သင်ယူရည်မှန်းချက်များ

ဒီလမ်းညွှန်ကိုပြီးစီးပါက၊ သင်သည်:
- Azure Developer CLI ပြဿနာများကို Diagnostic နည်းလမ်းများဖြင့် ကျွမ်းကျင်စွာရှာဖွေနိုင်မည်
- Authentication နှင့် Permission ပြဿနာများကို နားလည်ပြီး ဖြေရှင်းနိုင်မည်
- Deployment မအောင်မြင်မှုများ၊ Infrastructure Provisioning အမှားများနှင့် Configuration ပြဿနာများကို ဖြေရှင်းနိုင်မည်
- Proactive Monitoring နှင့် Debugging Strategy များကို အကောင်အထည်ဖော်နိုင်မည်
- ပြဿနာရှာဖွေခြင်းနည်းလမ်းများကို စနစ်တကျအသုံးပြုနိုင်မည်
- Log နှင့် Monitoring ကိုမှန်ကန်စွာ Configure လုပ်ပြီး အနာဂတ်ပြဿနာများကို ကာကွယ်နိုင်မည်

## သင်ယူရလဒ်များ

ဒီလမ်းညွှန်ကိုပြီးစီးပါက၊ သင်သည်:
- Azure Developer CLI ပြဿနာများကို Built-in Diagnostic Tools အသုံးပြု၍ ရှာဖွေနိုင်မည်
- Authentication, Subscription, Permission ပြဿနာများကို ကိုယ်တိုင်ဖြေရှင်းနိုင်မည်
- Deployment မအောင်မြင်မှုများနှင့် Infrastructure Provisioning အမှားများကို ထိရောက်စွာ Troubleshoot လုပ်နိုင်မည်
- Application Configuration ပြဿနာများနှင့် Environment-specific ပြဿနာများကို Debug လုပ်နိုင်မည်
- Monitoring နှင့် Alerting ကို Proactively အသုံးပြု၍ ပြဿနာများကို ရှာဖွေနိုင်မည်
- Logging, Debugging နှင့် Problem Resolution Workflow များအတွက် Best Practices များကို အသုံးပြုနိုင်မည်

## အမြန် Diagnostic

အထူးပြဿနာများကို စတင်ရှာဖွေမည်မတိုင်မီ၊ ဒီ Commands များကို Run လုပ်ပြီး Diagnostic အချက်အလက်များကို စုဆောင်းပါ:

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

## Authentication ပြဿနာများ

### ပြဿနာ: "Failed to get access token"
**လက္ခဏာများ:**
- `azd up` Authentication အမှားများဖြင့် မအောင်မြင်
- Commands "unauthorized" သို့မဟုတ် "access denied" ပြန်လာ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Deployment အတွင်း "Insufficient privileges"
**လက္ခဏာများ:**
- Deployment Permission အမှားများဖြင့် မအောင်မြင်
- Azure Resources တချို့ကို Create လုပ်လို့မရ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ပြဿနာ: Multi-tenant Authentication ပြဿနာများ
**ဖြေရှင်းနည်းများ:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Infrastructure Provisioning အမှားများ

### ပြဿနာ: Resource Name Conflict
**လက္ခဏာများ:**
- "The resource name already exists" အမှားများ
- Resource Creation အတွင်း Deployment မအောင်မြင်

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Location/Region မရရှိနိုင်
**လက္ခဏာများ:**
- "The location 'xyz' is not available for resource type"
- Region ရွေးချယ်မှုအတွင်း SKUs မရရှိနိုင်

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Quota အလွန်ကျော်မှု
**လက္ခဏာများ:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Bicep Template အမှားများ
**လက္ခဏာများ:**
- Template Validation မအောင်မြင်မှု
- Bicep Files Syntax အမှားများ

**ဖြေရှင်းနည်းများ:**
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

## 🚀 Deployment မအောင်မြင်မှုများ

### ပြဿနာ: Build မအောင်မြင်မှု
**လက္ခဏာများ:**
- Deployment အတွင်း Application Build မအောင်မြင်
- Package Installation အမှားများ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Container Deployment မအောင်မြင်မှု
**လက္ခဏာများ:**
- Container Apps မစတင်နိုင်
- Image Pull အမှားများ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Database Connection မအောင်မြင်မှု
**လက္ခဏာများ:**
- Application Database ကို ချိတ်ဆက်လို့မရ
- Connection Timeout အမှားများ

**ဖြေရှင်းနည်းများ:**
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

## 🔧 Configuration ပြဿနာများ

### ပြဿနာ: Environment Variables မအလုပ်လုပ်
**လက္ခဏာများ:**
- App Configuration Values မဖတ်နိုင်
- Environment Variables အလွတ်ဖြစ်နေ

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: SSL/TLS Certificate ပြဿနာများ
**လက္ခဏာများ:**
- HTTPS မအလုပ်လုပ်
- Certificate Validation အမှားများ

**ဖြေရှင်းနည်းများ:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ပြဿနာ: CORS Configuration ပြဿနာများ
**လက္ခဏာများ:**
- Frontend API ကို ခေါ်လို့မရ
- Cross-origin Request Block ဖြစ်နေ

**ဖြေရှင်းနည်းများ:**
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

## 🌍 Environment Management ပြဿနာများ

### ပြဿနာ: Environment Switching ပြဿနာများ
**လက္ခဏာများ:**
- မှားယွင်းသော Environment ကို အသုံးပြုနေ
- Configuration မှန်ကန်စွာ Switch မဖြစ်

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Environment Corruption
**လက္ခဏာများ:**
- Environment Invalid State ပြ
- Resources Configuration နှင့် မကိုက်ညီ

**ဖြေရှင်းနည်းများ:**
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

## 🔍 Performance ပြဿနာများ

### ပြဿနာ: Deployment အချိန်နှေးကွေး
**လက္ခဏာများ:**
- Deployment အချိန်များကြာ
- Deployment အတွင်း Timeout ဖြစ်

**ဖြေရှင်းနည်းများ:**
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

### ပြဿနာ: Application Performance ပြဿနာများ
**လက္ခဏာများ:**
- Response Time နှေးကွေး
- Resource Usage မြင့်မား

**ဖြေရှင်းနည်းများ:**
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

## 🛠️ Troubleshooting Tools နှင့် Commands

### Debug Commands
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

### Log Analysis
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource Investigation
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 အပိုဆောင်းအကူအညီရယူခြင်း

### Escalate လုပ်ရန်အချိန်
- Authentication ပြဿနာများကို အားလုံးစမ်းပြီးနောက်လည်း မဖြေရှင်းနိုင်
- Azure Services နှင့်ဆိုင်သော Infrastructure ပြဿနာများ
- Billing သို့မဟုတ် Subscription ပြဿနာများ
- လုံခြုံရေးဆိုင်ရာ စိုးရိမ်မှုများ

### Support Channels
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

### Support ကိုဆက်သွယ်မည်မတိုင်မီ စုဆောင်းရန်အချက်အလက်များ
- `azd version` Output
- `azd info` Output
- Error Messages (အပြည့်အစုံ)
- ပြဿနာကို ပြန်လုပ်နိုင်သောအဆင့်များ
- Environment Details (`azd env show`)
- ပြဿနာစတင်ချိန် Timeline

### Log Collection Script
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

## 📊 ပြဿနာကာကွယ်ခြင်း

### Pre-deployment Checklist
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

### Monitoring Setup
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

### Regular Maintenance
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## ဆက်စပ်အရင်းအမြစ်များ

- [Debugging Guide](debugging.md) - Debugging နည်းလမ်းများ
- [Provisioning Resources](../deployment/provisioning.md) - Infrastructure Troubleshooting
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Resource Planning လမ်းညွှန်
- [SKU Selection](../pre-deployment/sku-selection.md) - Service Tier အကြံပေးချက်များ

---

**အကြံပြုချက်**: ဒီလမ်းညွှန်ကို Bookmark လုပ်ထားပြီး ပြဿနာများကို ရှာဖွေချိန်တိုင်း ပြန်လည်ကြည့်ရှုပါ။ အများဆုံးပြဿနာများမှာ ရှိပြီးသားဖြေရှင်းနည်းများပါဝင်ပါတယ်။

---

**Navigation**
- **ယခင်သင်ခန်းစာ**: [Provisioning Resources](../deployment/provisioning.md)
- **နောက်သင်ခန်းစာ**: [Debugging Guide](debugging.md)

---

**အကြောင်းကြားချက်**:  
ဤစာရွက်စာတမ်းကို AI ဘာသာပြန်ဝန်ဆောင်မှု [Co-op Translator](https://github.com/Azure/co-op-translator) ကို အသုံးပြု၍ ဘာသာပြန်ထားပါသည်။ ကျွန်ုပ်တို့သည် တိကျမှုအတွက် ကြိုးစားနေသော်လည်း၊ အလိုအလျောက် ဘာသာပြန်ခြင်းတွင် အမှားများ သို့မဟုတ် မမှန်ကန်မှုများ ပါရှိနိုင်သည်ကို သတိပြုပါ။ မူရင်းဘာသာစကားဖြင့် ရေးသားထားသော စာရွက်စာတမ်းကို အာဏာရှိသော ရင်းမြစ်အဖြစ် သတ်မှတ်သင့်ပါသည်။ အရေးကြီးသော အချက်အလက်များအတွက် လူ့ဘာသာပြန်ပညာရှင်များကို အသုံးပြုရန် အကြံပြုပါသည်။ ဤဘာသာပြန်ကို အသုံးပြုခြင်းမှ ဖြစ်ပေါ်လာသော အလွဲအလွတ်များ သို့မဟုတ် အနားယူမှားမှုများအတွက် ကျွန်ုပ်တို့သည် တာဝန်မယူပါ။